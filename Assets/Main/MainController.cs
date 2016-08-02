using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;
using UnityEngine.UI;


public class MainController : MonoBehaviour
{

    public Image Background;

    // Use this for initialization
    void Start () {

        if (SceneManager.sceneCount != 1)
        {
            GameObject go = (GameObject)Instantiate(Resources.Load("ResumeButton"));
            go.transform.SetParent(Background.gameObject.transform, false);
        }
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

    public void Quit()
    {
        Debug.Log("Quitting!");
        Application.Quit();
    }

    public void Lore()
    {
        Debug.Log("Lore!");
        SceneManager.LoadScene("LoreScene");
    }

    public void BeginGame()
    {
        Debug.Log("Starting!");
        SceneManager.LoadScene("DrillingScene");
        SceneManager.UnloadScene("MainScene");
    }

    public void ReturnToGame()
    {
        Debug.Log("Returning!");
        SceneManager.UnloadScene("MainScene");
    }
}
