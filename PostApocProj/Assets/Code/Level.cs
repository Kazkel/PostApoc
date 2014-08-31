using UnityEngine;
using System.Collections;

public class Level : MonoBehaviour {


	private int levelWidth;
	private int levelHeight;

	// there needs to be one for every prefab that needs to be instantiated
	public Transform floorTile;
	public Transform wallTile;
	public Transform tableTile;
	public Transform horizontalDoorTile;
	public Transform verticalDoorTile;
	public Transform chestTile;
	
	private Color[] tileColours;

	//there needs to be a color corresponding to each prefab above
	public Color floorColour;
	public Color wallColour;
	public Color spawnPointColour;
	public Color tableColour;
	public Color horizontalDoorColour;
	public Color verticalDoorColour;
	public Color chestColour;

	//the texture that defines the layout of instantiation of the level
	public Texture2D levelTexture;
	
	public Entity player;

	//get the texture width and height and set it to the variable
	void Start () {
		levelWidth = levelTexture.width;
		levelHeight = levelTexture.height;
		loadLevel();
		
	}
	
	
	void Update () {
		
	}
	void loadLevel()
	{
		
		tileColours = new Color[levelWidth * levelHeight]; //find the colour of the pixels given in level texture
		tileColours = levelTexture.GetPixels();
		
		for (int y = 0; y < levelHeight; y++) //set y to the level height
		{
			
			for (int x = 0; x < levelWidth; x++) //set x to the level width
			{
				
				
				if(tileColours[x+y*levelWidth] == floorColour) //if the pixel color is the same as floor colour, 
				{
					Instantiate(floorTile, new Vector3(x, y), Quaternion.identity); //instantiate floortile prefab
				}

				if(tileColours[x+y*levelWidth] == wallColour) //this repeats for all current prefabs with colour set up
				{
					Instantiate(wallTile, new Vector3(x, y), Quaternion.identity);
					
				}

				if(tileColours[x+y*levelWidth] == spawnPointColour)//if colour equals spawn point, instantiate floor tile
				{
					Instantiate(floorTile, new Vector3(x, y), Quaternion.identity);
					Vector2 pos = new Vector2(x, y); // create new vector "pos" with spawnpoint coordinates
					player.transform.position = pos; // move player position to "pos"
					
				}

				if(tileColours[x+y*levelWidth] == tableColour) 
				{
					Instantiate(tableTile, new Vector3(x, y), Quaternion.identity); 
				}

				if(tileColours[x+y*levelWidth] == horizontalDoorColour) 
				{
					Instantiate(horizontalDoorTile, new Vector3(x, y), Quaternion.identity); 
				}

				if(tileColours[x+y*levelWidth] == verticalDoorColour) 
				{
					Instantiate(verticalDoorTile, new Vector3(x, y), Quaternion.identity); 
				}


				if(tileColours[x+y*levelWidth] == chestColour) 
				{
					Instantiate(chestTile, new Vector3(x, y), Quaternion.identity); 
				}
			}
		}
	}
}﻿