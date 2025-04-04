
class OrbList {

  OrbNode front;

  OrbList() {
    front = null;
  }//constructor

  void addFront(OrbNode o) {
    if (front == null) {
      front = o;
    } else {
      o.next = front;
      front.previous = o;
      front = o;
    }
  }//addFront

  void populate(int n, boolean ordered) {
    for (int i = 0; i < n; i++) {
      if (!ordered) {
        addFront(new OrbNode());
      } else {
        addFront(new OrbNode((width/(n+1))*(i+1), height/2, random(MIN_SIZE, MAX_SIZE), random(MIN_MASS, MAX_MASS)));
      }
    }
  }//populate

  void display() {
    OrbNode ori = front;
    while (ori != null) {
      ori.display();
      ori = ori.next;
    }
  }//display

  void applySprings(int springLength, float springK) {
    OrbNode ori = front;
    while (ori != null) {
      ori.applySprings(springLength, springK);
      ori = ori.next;
    }
  }//applySprings
  void applyFriction(float frictionk) {
    OrbNode ori = front;
    while (ori != null) {
      ori.applyForce(ori.getFriction(frictionk));
      ori = ori.next;
    }
  }//applySprings
  
  
  void applyDrag(float dragK) {
    OrbNode ori = front;
    while (ori != null) {
      ori.applyForce(ori.getDragForce(dragK));
      ori = ori.next;
    }
  }//applySprings

  void applyGravity(Orb other, float gConstant) {
    OrbNode ori = front;
    while (ori != null) {
      ori.applyForce(ori.getGravity(other, gConstant));
      ori = ori.next;
    }
  }//applySprings

  void run(boolean bounce) {
    OrbNode ori = front;
    while (ori != null) {
      ori.move(bounce);
      ori = ori.next;
    }
  }//applySprings

  void removeFront() {
    OrbNode ori = front.next;
    front = null;
    front = ori;
  }//removeFront

  OrbNode getSelected(float x, float y) {
    OrbNode ori = front;
    PVector vio = new PVector(x, y);
    while (ori != null) {
      if (ori.center.dist(vio) == 0) {
        return ori;
      }
      ori = ori.next;
    }
    return null;
  }//getSelected

  void removeNode(OrbNode o) {
    if (o.next != null) {
      OrbNode ori = o.next;
      o = ori;
    } else {
      o = null;
    }
  }
}//OrbList
