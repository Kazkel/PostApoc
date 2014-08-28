﻿using UnityEngine;
using System.Collections;

public class Player : Entity {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {

		//when key is pressed, apply force to rigidbody
		if(Input.GetKey(KeyCode.W)) {
			rigidbody2D.transform.position += Vector3.up * speed * Time.deltaTime;
		}
		if(Input.GetKey(KeyCode.S)) {
			rigidbody2D.transform.position += Vector3.down * speed * Time.deltaTime;
		}
		if(Input.GetKey(KeyCode.A)) {
			rigidbody2D.transform.position += Vector3.left * speed * Time.deltaTime;
		}
		if(Input.GetKey(KeyCode.D)) {
			rigidbody2D.transform.position += Vector3.right * speed * Time.deltaTime;
		}
	}
}
