using UnityEngine;
using System.Collections;

public class Player : Entity {

	public Vector2 speed = new Vector2(25, 25);
	
	private Vector2 movement;
	
	void Update()
	{
		float inputX = Input.GetAxis("Horizontal");
		float inputY = Input.GetAxis("Vertical");
		
		movement = new Vector2(speed.x * inputX, speed.y * inputY);
		
		if (inputX != 0 && inputY != 0) {
			movement *= 0.707106781f;
		}
	}
	
	void FixedUpdate()
	{
		rigidbody2D.velocity = movement;
		//which one is preferrable?
		//rigidbody2D.AddForce (movement);
	}
}
