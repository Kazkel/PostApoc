using UnityEngine;
using System.Collections;

public class FogofWar : MonoBehaviour {

	public Transform opaqueFow;
	public Transform translucentFow;
	public Transform transparentFow;


	// Use this for initialization
	void Start () {

		Instantiate (opaqueFow, transform.position, transform.rotation);	

		collider = GetComponent<BoxCollider2D>();
	}
	
	// Update is called once per frame
	void Update () {

		if Input.GetKey(KeyCode.F){


		}

	}

	void 
}
