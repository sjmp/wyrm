using UnityEngine;
using UnityEngine.UI;

namespace Assets.Drilling
{
    public class DrillingController : MonoBehaviour
    {
        public Text TitleText;
        public Text BodyText;

        // Use this for initialization
        void Start ()
        {
            TitleText.text = "Myer & Son's Mechanised Drilltrain";
            BodyText.text = "A mud caked industrial monstrosity, designed to hunt Wyrms in the depths of the earth";
        }
	
        // Update is called once per frame
        void Update () {
	
        }
    }
}
