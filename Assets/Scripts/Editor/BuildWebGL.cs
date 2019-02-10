using System.Collections;
using System.Collections.Generic;
using UnityEditor;

public class BuildWebGL
{
	public static void Build()
	{
		string[] scenes = {"Assets/Scenes/SampleScene.unity"};
		BuildPipeline.BuildPlayer(scenes, "Builds/WebGL", BuildTarget.WebGL, BuildOptions.None);
	}
}
