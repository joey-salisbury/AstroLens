using UnityEngine;
using System.Collections;

public class RotateGameObject : MonoBehaviour {

    public float turnSpeed = 0.5f;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {

        transform.Rotate(Vector3.up, -turnSpeed * Time.deltaTime);

    }
}
