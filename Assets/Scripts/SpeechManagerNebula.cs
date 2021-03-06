﻿using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.Windows.Speech;

public class SpeechManagerNebula : MonoBehaviour {


    KeywordRecognizer keywordRecognizer = null;
    Dictionary<string, System.Action> keywords = new Dictionary<string, System.Action>();

    // Use this for initialization
    void Start()
    {
        keywords.Add("Reset world", () =>
        {
            // Call the OnReset method on every descendant object.
            this.BroadcastMessage("OnReset");
        });

        keywords.Add("Show 3D render", () =>
        {
            // Call the OnReset method on every descendant object.
            this.BroadcastMessage("OnShow3DRender");
        });

        keywords.Add("Show infrared projection", () =>
        {
            // Call the OnReset method on every descendant object.
            this.BroadcastMessage("OnShowInfrared");
        });

        keywords.Add("Show regions of interest", () =>
        {
            // Call the OnReset method on every descendant object.
            this.BroadcastMessage("OnShowRegionsOfInterest");
        });

        // Tell the KeywordRecognizer about our keywords.
        keywordRecognizer = new KeywordRecognizer(keywords.Keys.ToArray());

        // Register a callback for the KeywordRecognizer and start recognizing!
        keywordRecognizer.OnPhraseRecognized += KeywordRecognizer_OnPhraseRecognized;
        keywordRecognizer.Start();
    }

    private void KeywordRecognizer_OnPhraseRecognized(PhraseRecognizedEventArgs args)
    {
        System.Action keywordAction;
        if (keywords.TryGetValue(args.text, out keywordAction))
        {
            keywordAction.Invoke();
        }
    }
}
