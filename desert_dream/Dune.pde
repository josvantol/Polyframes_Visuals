class Dune {
  PVector v1, v2, v3, v4, v5;
  PVector c1, c2, c3, c4, c5;
  float duneHeight, duneWidth;
  float anchorDistance1, anchorDistance2, anchorDistance3, anchorDistance4, shadowSideDistance, frontDistance, duneCurve;

  Dune(float initHeight, float initWidth) {
    duneHeight = initHeight;
    duneWidth = initWidth;
    
    frontDistance = random(3, 7);
    duneCurve = random(0.1, 0.4);
    anchorDistance1 = random(duneHeight * frontDistance);
    anchorDistance2 = random(duneWidth/2);
    anchorDistance3 = random(duneWidth/2);
    anchorDistance4 = random(duneHeight);
    shadowSideDistance = random(1.5, 5);
  }
  
  void draw(float origin_x, float origin_y, float scale) {
    //Calculate dune coördinates
    v1 = new PVector(origin_x,
                     origin_y); //right base
    v2 = new PVector(v1.x - ((duneHeight + duneWidth * duneCurve) * frontDistance) * scale,
                     v1.y - (duneHeight + duneWidth * duneCurve) * scale); //right top
    v3 = new PVector(v2.x - (duneWidth) * scale,
                     v2.y + (duneWidth * duneCurve) * scale); //left top
    v4 = new PVector(v3.x - (duneHeight) * scale,
                     v3.y + (duneHeight) * scale); //left base
    v5 = new PVector(v3.x - (duneHeight * shadowSideDistance) * scale,
                     v3.y + (duneHeight - 10) * scale); //shadow side
    
    //Setup random bezier anchors
    c1 = new PVector(v1.x - anchorDistance1 * scale, v1.y);
    c2 = new PVector(v2.x + anchorDistance2 * scale, v2.y);
    c3 = new PVector(v3.x + anchorDistance3 * scale, v3.y);
    c4 = new PVector(v4.x + anchorDistance4 * scale, v4.y);
    c5 = new PVector(v5.x, v5.y);
    
    //Draw the shadow side first
    fill(back);
    beginShape();
    vertex(v5.x, v5.y);
    bezierVertex(c5.x, c5.y, v3.x*2-c3.x, c3.y, v3.x, v3.y);
    bezierVertex(v3.x*2-c3.x, c3.y, c4.x, c4.y, v4.x, v4.y);
    endShape();
    
    //Draw the dune
    fill(front);
    beginShape();
    vertex(v1.x, v1.y);
    bezierVertex(c1.x, c1.y, c2.x, c2.y, v2.x, v2.y);
    bezierVertex(v2.x-c2.x+v2.x, c2.y, c3.x, c3.y, v3.x, v3.y);
    bezierVertex(v3.x*2-c3.x, c3.y, c4.x, c4.y, v4.x, v4.y);
    endShape();
  }
  
  PVector getDestination () {
    return v4;
  }
}
