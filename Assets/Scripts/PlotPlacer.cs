using UnityEngine;
using System.Collections;

public class PlotPlacer : MonoBehaviour {

    bool placing;


    // Use this for initialization
    void Start () {

        placing = true;

	}

    void Update()
    {
        if (placing)
        {
            // Do a raycast into the world that will only hit the Spatial Mapping mesh.
            var headPosition = Camera.main.transform.position;
            var gazeDirection = Camera.main.transform.forward;

            RaycastHit hitInfo;
            if (Physics.Raycast(headPosition, gazeDirection, out hitInfo,
                30.0f, SpatialMapping.PhysicsRaycastMask))
            {
                // Move this object's parent object to
                // where the raycast hit the Spatial Mapping mesh.
                this.transform.position = hitInfo.point;

                // Rotate this object's parent object to face the user.
                //Quaternion toQuat = Camera.main.transform.localRotation;
                //toQuat.x = 0;
                //toQuat.z = 0;
                //this.transform.rotation = toQuat;
            }
        }
    }

    // Update is called once per frame
    void OnSelect()
    {
        // On each Select gesture, toggle whether the user is in placing mode.
        placing = !placing;


        if (placing) {
            SpatialMapping.Instance.DrawVisualMeshes = true;
        }
        
        // If the user is not in placing mode, hide the spatial mapping mesh.
        else
        {
            SpatialMapping.Instance.DrawVisualMeshes = false;
        }

    }
}
