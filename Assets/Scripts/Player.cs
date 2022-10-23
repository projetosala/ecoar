using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    public float jumpForce;
    public bool isJumping;
    public float speed;
    public bool jumpPressed;
    public int move;
    Rigidbody2D rb;
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
    }
    void Update()
    {
        Jump();
    }

    void FixedUpdate()
    {
        rb.velocity = new Vector2(move * speed * Time.deltaTime, rb.velocity.y);
    }
    public void JumpPress(bool jumpButtonPressed){
        jumpPressed = jumpButtonPressed;
    }
    public void Jump()
    {
        if (jumpPressed)
        {
            if (isJumping == false)
            {
                rb.AddForce(new Vector2(0f, jumpForce), ForceMode2D.Impulse);
            }

        }
    }

    void OnCollisionEnter2D(Collision2D collision)
    {
        if (collision.gameObject.layer == 10)
        {
            isJumping = false;
        }

    }

    void OnCollisionExit2D(Collision2D collision)
    {
        if (collision.gameObject.layer == 10)
        {
            isJumping = true;
        }
    }
    public void TouchHorizontal(int moveDirection){
        move = moveDirection;
    }
}
