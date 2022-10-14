using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    public float jumpForce = 25;
    public bool isJumping;
    public float speed = 200;
    Vector2 move;
    Rigidbody2D rb;
    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        

    }

    // Update is called once per frame
    void Update()
    {
        move = new Vector2(Input.GetAxisRaw("Horizontal"), Input.GetAxisRaw("Vertical"));
        Jump();
    }

    void FixedUpdate() {
        //rb.AddForce(move * speed * Time.deltaTime); //Movimentação envolvendo atrito
        rb.velocity = new Vector2(move.x * speed * Time.deltaTime, rb.velocity.y); //Movimentação envolvendo movimento comum.
    }

    void Jump(){
        if (Input.GetButtonDown("Jump")){
            if(isJumping == false){
                rb.AddForce(new Vector2(0f, jumpForce), ForceMode2D.Impulse);
            }
            
        }
    }

    void OnCollisionEnter2D(Collision2D collision){
        if (collision.gameObject.layer == 10){
            isJumping = false;
        }
        
    }

    void OnCollisionExit2D(Collision2D collision){
        if (collision.gameObject.layer == 10){
            isJumping = true;
        }
    }
}
