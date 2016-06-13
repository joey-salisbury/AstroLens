using UnityEngine;
using System.Collections;

public class PowerUp : MonoBehaviour {
	// This is an unusual but handy use of Vector2s. x holds a min value
	// and y a max value for a Random.Range() that will be called later
	public Vector2 			rotMinMax = new Vector2(15,90);
	public Vector2			driftMinMax = new Vector2(.25f,2);
    
    public bool				_____________;

    public bool             hitAlready;
    public bool             isBlinking;

    public float            blinkTime;

    public int              targetNum;

    public GameObject 		cube; // Reference to the Cube child
    public GameObject       correctSound;
    public GameObject       incorrectSound;

    public Vector3			rotPerSecond; // Euler rotation speed
    public float            rotMultiplier;

    bool grow;
    bool shrink;

    private float blinkTimer = 0f;

    void Awake() {

        InitializeCube();

	}

    public void InitializeCube()
    {
        // Find the Cube reference
        cube = transform.Find("Cube").gameObject;
        correctSound = transform.Find("CorrectSound").gameObject;

        incorrectSound = transform.Find("IncorrectSound").gameObject;

        //We are just starting, so target isn't hit yet.
        hitAlready = false;
        isBlinking = false;

        // Set a random velocity
        Vector3 vel = Random.onUnitSphere; // Get random XYZ velocity
                                           // Random.OnUnitSphere gives you a vector point that is somewhere on
                                           // the surface of the sphere with a radium of 1m around the origin
        vel.z = 0;
        vel.Normalize(); //Make the length of the vel 1
                         // Normalizing a Vector3 makes it length 1m
        vel *= Random.Range(driftMinMax.x, driftMinMax.y);
        // Above sets the velocity length to something between the x and y
        // values of driftMinMAx
        GetComponent<Rigidbody>().velocity = vel;

        // Set the rotation towards camera.
        transform.LookAt(Camera.main.transform);

        // Set up the rotPerSecond for the cube child using rotMinMax x & y
        rotPerSecond = new Vector3(Random.Range(rotMinMax.x, rotMinMax.y),
                                    Random.Range(rotMinMax.x, rotMinMax.y),
                                    Random.Range(rotMinMax.x, rotMinMax.y));

        rotMultiplier = 1;
    }


	// Update is called once per frame
	void Update () {
        // Manually rotate the Cube child every Update()
        // Multiplying it by Time.time causes the rotation to be time-based

        if (grow)
        {   rotMultiplier += Time.deltaTime;
        } else if (shrink)
        {   rotMultiplier -= Time.deltaTime;
        } else
        {   rotMultiplier = 1;
        }

        cube.transform.rotation = Quaternion.Euler(rotPerSecond * Time.time * rotMultiplier);
        cube.transform.localScale = new Vector3(2f, 2f, 2f) * (Mathf.Pow(rotMultiplier,2));

        if (isBlinking)
        {
            blinkTimer += Time.deltaTime;
            
            if (blinkTimer > blinkTime)
            {
                isBlinking = false;
                blinkTimer = 0f;
                CancelInvoke("Blink");
                if (!hitAlready)
                {
                    cube.GetComponent<Renderer>().material.color = Color.cyan;
                } else
                {
                    cube.GetComponent<Renderer>().material.color = Color.magenta;

                }
            } 
        }


    }

    public void CorrectSelection()
    {
        cube.GetComponent<Renderer>().material.color = Color.magenta;
        correctSound.GetComponent<AudioSource>().Play();
        StartCoroutine(GrowAndShrink());

        hitAlready = true;
        if (isBlinking)
        {
            isBlinking = false;
            blinkTimer = 0f;
            CancelInvoke("Blink");
        }

    }

    public void IncorrectSelection()
    {

        incorrectSound.GetComponent<AudioSource>().Play();
        if (!isBlinking)
        {
            cube.GetComponent<Renderer>().material.color = Color.red;
            isBlinking = true;
            InvokeRepeating("Blink", 0, 0.1f);
        }
    }

    void Blink()
    {
        if (cube.GetComponent<Renderer>().material.color == Color.red)
        {
            cube.GetComponent<Renderer>().material.color = Color.cyan;

        }
        else
        {
            cube.GetComponent<Renderer>().material.color = Color.red;

        }
    }

    IEnumerator GrowAndShrink()
    {
        grow = true;
        yield return new WaitForSeconds(0.5f);
        grow = false;
        shrink = true;
        yield return new WaitForSeconds(0.5f);
        shrink = false;

    }


}
