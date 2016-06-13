using UnityEngine;
using System.Collections;

public class TapToCreatePlot : MonoBehaviour {

    public GameObject plotPrefab;

    // Called by GazeGestureManager when the user performs a Select gesture
    void OnSelect()
    {
        Instantiate(plotPrefab, transform.position, Quaternion.identity);
        if ( SpatialMapping.Instance.DrawVisualMeshes)
        {
            SpatialMapping.Instance.DrawVisualMeshes = false;
        }
        return;
    }

}
