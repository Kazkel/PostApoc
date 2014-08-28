using UnityEngine;
using System.Collections;

public class PlayerMovement : MonoBehaviour {

	public float speed;

	void Update () {

		if (Input.GetKey (KeyCode.D)) {
			transform.Translate (Vector3.right * speed);
		}

		if (Input.GetKey (KeyCode.A)) {
			transform.Translate (-Vector3.right * speed);
		}

		if (Input.GetKey (KeyCode.W)) {
			transform.Translate (Vector3.up * speed);
		}

		if (Input.GetKey (KeyCode.S)) {
			transform.Translate (-Vector3.up * speed);
		}
	
	}
}
