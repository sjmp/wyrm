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
        public Text BodyText;

        public Image ScrollContent;

        // Use this for initialization
        void Start ()
        {
            InkStory = new Story(InkAsset.text);
            InkStory.Continue();

            InkStory.ChooseChoiceIndex(0);
            InkStory.Continue();

            TitleText.text = InkStory.currentText;
            InkStory.Continue();
            BodyText.text = InkStory.currentText;

            foreach (var choice in InkStory.currentChoices)
            {
                GameObject go = (GameObject)Instantiate(Resources.Load("Button")); 
                go.transform.SetParent(ScrollContent.gameObject.transform);
                go.GetComponentInChildren<Text>().text = choice.text;

            };


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
