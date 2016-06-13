using UnityEngine;
using System.Collections;

public class NebulaCommands : MonoBehaviour
{
    public GameObject target;

    public GameObject startPosGO;
    public GameObject endPosGO;

    public float transitionTime;

    public GameObject InfraredCloud;
    public GameObject gameCubes; 

    Vector3 startScale;
    Vector3 endPos;

    bool active;
    bool running;

    // Use this for initialization
    void Start()
    {
        startScale = target.transform.localScale;
        //target.transform.position = startPosGO.transform.position;
        target.transform.position = new Vector3(1000f, 1000f, 1000f);
        target.transform.localScale = startScale * 0.01f;
        
        active = false;
        running = false;
    }

    void OnShowInfrared()
    {
        if (target.activeSelf)
        {
            target.SetActive(false);

            InfraredCloud.SetActive(true);
        } else
        {
            target.SetActive(true);

            InfraredCloud.SetActive(false);
        }


    }

    void OnShowRegionsOfInterest()
    {
        gameCubes.SetActive(!gameCubes.activeSelf);
    }

        // Called by GazeGestureManager when the user performs a Select gesture
        void OnShow3DRender()
    {
        if (active && !running)
        {
            running = true;
            StartCoroutine(ShrinkTarget());
        }
        else if (!running)
        {
            running = true;
            StartCoroutine(GrowTarget());
        }

    }

    IEnumerator ShrinkTarget()
    {
        float startTime = Time.time;
        while (Time.time < startTime + 1.0f)
        {
            target.transform.position = Vector3.Lerp(target.transform.position, startPosGO.transform.position, (Time.time - startTime) / transitionTime);
            target.transform.localScale = Vector3.Lerp(target.transform.localScale, startScale * 0.01f, (Time.time - startTime) / transitionTime);
            yield return null;
        }

        target.transform.position = new Vector3(1000f, 1000f, 1000f);
        active = false;
        running = false;
    }

    IEnumerator GrowTarget()
    {

        float startTime = Time.time;
        target.transform.position = startPosGO.transform.position;
        endPos = endPosGO.transform.position;


        //target.SetActive(true);
        while (Time.time < startTime + transitionTime)
        {
            target.transform.position = Vector3.Lerp(target.transform.position, endPos, (Time.time - startTime) / transitionTime);
            target.transform.localScale = Vector3.Lerp(target.transform.localScale, startScale, (Time.time - startTime) / transitionTime);
            yield return null;
        }

        active = true;
        running = false;
    }

    // Called by SpeechManager when the user says the "Reset world" command
    void OnReset()
    {
        Application.LoadLevel(Application.loadedLevel);
    }


}