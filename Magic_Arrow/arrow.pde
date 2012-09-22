class Arrow {


  void display() {
    translate(width/2, height/2);
    stroke(0, 0, 0);
    strokeWeight(3);
    fill(0, 0, 0);

    beginShape();
    vertex(0, 0);
    vertex(25, 5);
    vertex(90,90);
    vertex(5, 25);
    vertex(0, 0);

    endShape();
  }//display
}//class

