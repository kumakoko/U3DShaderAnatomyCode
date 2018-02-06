using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SelfRotation : MonoBehaviour
{
    private Transform m_Transform = null;

	void Start ()
    {
        m_Transform = this.transform;
	}
	
	// Update is called once per frame
	void Update ()
    {
        Vector3 eulerAngles = m_Transform.localEulerAngles;
        eulerAngles.y += 1.0f;
        m_Transform.localRotation = Quaternion.Euler(eulerAngles);
	}
}
