using UnityEngine;
using UnityEngine.VR.WSA.Input;
using System.Collections;

public class GazeGestureManager : MonoBehaviour
{
    public static GazeGestureManager Instance { get; private set; }
    public float rate;
    // Represents the hologram that is currently being gazed at.
    public GameObject FocusedObject { get; private set; }

    GestureRecognizer recognizer;

    bool pulsing;

    // Use this for initialization
    void Start()
    {
        Instance = this;
        pulsing = false;
        // Set up a GestureRecognizer to detect Select gestures.
        recognizer = new GestureRecognizer();
        recognizer.TappedEvent += (source, tapCount, ray) =>
        {
            Debug.Log(FocusedObject.name);
            // Send an OnSelect message to the focused object and its ancestors.
            if (FocusedObject != null && FocusedObject.name != "Cube")
            {
                FocusedObject.SendMessageUpwards("OnSelect");
            }
            else if (FocusedObject.name == "Cube") { 
                FocusedObject.SendMessage("OnSelect");
            }
        };
        recognizer.StartCapturingGestures();
    }

    // Update is called once per frame
    void Update()
    {
        // Figure out which hologram is focused this frame.
        GameObject oldFocusObject = FocusedObject;

        // Do a raycast into the world based on the user's
        // head position and orientation.
        var headPosition = Camera.main.transform.position;
        var gazeDirection = Camera.main.transform.forward;

        RaycastHit hitInfo;
        if (Physics.Raycast(headPosition, gazeDirection, out hitInfo))
        {
            // If the raycast hit a hologram, use that as the focused object.
            FocusedObject = hitInfo.collider.gameObject;


        }
        else
        {
            // If the raycast did not hit a hologram, clear the focused object.
            FocusedObject = null;
        }

        // If the focused object changed this frame,
        // start detecting fresh gestures again.
        if (FocusedObject.name == "Cube")
        {
            pulsing = true;
            StartCoroutine(PulseTarget());
        } else  if (FocusedObject != oldFocusObject)
        {
            recognizer.CancelGestures();
            recognizer.StartCapturingGestures();
            pulsing = false;
            StopCoroutine(PulseTarget());            
        }
    }

    IEnumerator PulseTarget()
    {
        float sizeScale = Mathf.PingPong(Time.time * rate, 0.2f) + 0.9f;
        FocusedObject.transform.localScale = Vector3.one * sizeScale;

        if (!FocusedObject.GetComponent<AudioSource>().isPlaying) { 
            FocusedObject.GetComponent<AudioSource>().Play();
        }
        yield return null;
    }
}