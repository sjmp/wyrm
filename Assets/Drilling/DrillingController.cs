using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.UI;
using Ink;
using Ink.Runtime;

namespace Assets.Drilling
{
    public class DrillingController : MonoBehaviour
    {
        public TextAsset InkAsset;
        public Story InkStory;
        public static Text TitleText; 
        public static Image ScrollContent; 
        public List<GameObject> Buttons;
        public Image BackgroundImage;
        public GameObject CurrentBox;
        public Image Wyrm;
        public bool UnleashTheWyrm = false;
        public bool AtStart = true;

        // Use this for initialization
        void Start ()
        {

            //Setup
            InkStory = new Story(InkAsset.text);
            InkStory.Continue();
            NewBox();
        }

        public void NewBox()
        {


            if (!AtStart)
            {
                //Choose and enter a random story
                InkStory.ChooseChoiceIndex(RandomTo(InkStory.currentChoices.Count));
                InkStory.Continue();
            }
            else
            {
                AtStart = false;
            }


            if (InkStory.currentText == "")
            {
                InkStory.ChooseChoiceIndex(RandomTo(InkStory.currentChoices.Count));
                InkStory.Continue();
            }

            //Setup the box
            CurrentBox = CreateBox();

            //Check for WYRM!!!
            var worm = (int) InkStory.variablesState["SEENWORM"];
            if (worm == 1)
            {
                Debug.Log("FIRE");
                UnleashTheWyrm = true;
            }

            if (InkStory.currentText.Length > 10)
            {
                try
                {
                    string[] tokens = InkStory.currentText.Split(' ');
                    string retVal = tokens[0] + " " + tokens[1];
                    TitleText.text = retVal + "...";
                }
                catch
                {
                    TitleText.text = "PARSE ERROR";
                }

            }
            else
            {
                TitleText.text = InkStory.currentText;
            }
            AddBlock();
        }

        public GameObject CreateBox()
        {
            GameObject go = (GameObject)Instantiate(Resources.Load("TextBox"));
            go.transform.SetParent(BackgroundImage.gameObject.transform, false);
            TitleText = go.transform.GetChild(0).transform.GetChild(0).transform.GetChild(0).GetComponentInChildren<Text>();
            ScrollContent = go.transform.GetChild(0).transform.GetChild(0).GetComponent<Image>();
            return go;
        }


        public void AddBlock()
        {
            if (InkStory.canContinue)
            {
                InkStory.Continue();    
            }

            NewBody();

            if (InkStory.currentChoices.All(x => x.text != "DRILL") || InkStory.currentChoices.Count == 0)
            {
                foreach (var choice in InkStory.currentChoices)
                {
                    var i = choice.index;
                    var go = NewButton(choice.text);
                    go.GetComponentInChildren<Button>().onClick.AddListener(delegate { Select(i, go); });
                    Buttons.Add(go);
                }
            }
            else
            {
                var go = NewButton("DRILL...");
                go.GetComponentInChildren<Button>().onClick.AddListener(DeleteBox);
            }


        }

        public void Select(int index, GameObject go)
        {
            Buttons.Remove(go);
            foreach (var button in Buttons)
            {
                Destroy(button);
            }
            go.GetComponent<Button>().interactable = false;
            InkStory.ChooseChoiceIndex(index);
            if (InkStory.canContinue)
            {
                InkStory.Continue();
            }
  
            AddBlock();
        }


        public void DeleteBox()
        {
            Destroy(CurrentBox);
            if (InkStory.currentChoices[0].text == "DRILL")
            {
                InkStory.ChooseChoiceIndex(0);
                InkStory.Continue();
            }

            NewBox();
        }

        private void NewBody()
        {
            GameObject bodyText = (GameObject)Instantiate(Resources.Load("BodyText"));
            bodyText.transform.SetParent(ScrollContent.gameObject.transform);
            bodyText.GetComponent<Text>().text = InkStory.currentText;
        }

        private GameObject NewButton(string text)
        {
            GameObject go = (GameObject)Instantiate(Resources.Load("Button"));
            go.transform.SetParent(ScrollContent.gameObject.transform);
            go.GetComponentInChildren<Text>().text = text;
            return go;
        }

        public int RandomTo(int max)
        {
            return Random.Range(0, max);
        }

            
	
        // Update is called once per frame
        void Update ()
        {
            if (UnleashTheWyrm)
            {
                Wyrm.gameObject.transform.Translate(0,1,0);
            } 
        }
    }
}
