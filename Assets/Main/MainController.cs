using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;
using UnityEngine.UI;


public class MainController : MonoBehaviour
{
    public static bool GameRunning;
    public Image Background;
    public Button StartButton;

    // Use this for initialization
    void Start ()
    {
        if (GameRunning)
        {
            GameObject go = (GameObject)Instantiate(Resources.Load("ResumeButton"));
            go.transform.SetParent(Background.gameObject.transform, false);
            go.GetComponentInChildren<Button>().onClick.AddListener(ReturnToGame);
            StartButton.GetComponentInChildren<Text>().text = "RESTART";
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
        SceneManager.LoadScene("LoreScene", LoadSceneMode.Additive);
    }

    public void BeginGame()
    {
        GameRunning = true;
        Debug.Log("Starting!");
        SceneManager.UnloadScene("DrillingScene");
        SceneManager.LoadScene("DrillingScene");
    }

    public void ReturnToGame()
    {
        Debug.Log("Returning!");
        SceneManager.UnloadScene("MainScene");
    }
}
