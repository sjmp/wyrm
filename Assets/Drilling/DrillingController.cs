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
        public Text TitleText;
        public Image ScrollContent;
        public List<GameObject> Buttons;

        // Use this for initialization
        void Start ()
        {
            InkStory = new Story(InkAsset.text);
            InkStory.Continue();

            InkStory.ChooseChoiceIndex(0);
            InkStory.Continue();

            TitleText.text = InkStory.currentText;
            AddBlock();
        }

        public void AddBlock()
        {
            InkStory.Continue();

            GameObject bodyText = (GameObject)Instantiate(Resources.Load("BodyText"));
            bodyText.transform.SetParent(ScrollContent.gameObject.transform);

            bodyText.GetComponent<Text>().text = InkStory.currentText;

            if (InkStory.currentChoices[0].pathStringOnChoice == "Top")
            {
                GameObject go = (GameObject)Instantiate(Resources.Load("Button"));
                go.transform.SetParent(ScrollContent.gameObject.transform);
                go.GetComponentInChildren<Text>().text = "DRILL";
            }

            foreach (var choice in InkStory.currentChoices)
            {
                GameObject go = (GameObject)Instantiate(Resources.Load("Button"));
                go.transform.SetParent(ScrollContent.gameObject.transform);
                go.GetComponentInChildren<Text>().text = choice.text;
                go.GetComponentInChildren<Button>().onClick.AddListener(delegate { Select(choice.index, go); });
                Buttons.Add(go);
            };
        }

        public void Select(int index, GameObject go)
        {
            foreach (var button in Buttons.Where(x => x != go))
            {
                Destroy(button);
            }
            go.GetComponent<Button>().interactable = false;
            InkStory.ChooseChoiceIndex(index);

            AddBlock();
        }

        

        public int RandomTo(int max)
        {
            return Random.Range(0, max);
        }
	
        // Update is called once per frame
        void Update () {
	
        }
    }
}
