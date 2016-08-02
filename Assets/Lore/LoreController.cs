using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;

public class LoreController : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

    public void ExitLore()
    {
        SceneManager.LoadScene("MainScene");
        SceneManager.UnloadScene("LoreScene");
    }
}
