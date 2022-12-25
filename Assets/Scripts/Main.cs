using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Main : MonoBehaviour
{
   private void Start() {
        LuaManager.GetInstance().Init();
        LuaManager.GetInstance().DoLuaFile("Main");
    } 
    
}
