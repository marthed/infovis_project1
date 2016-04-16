
protected float scaleFactor = 1.0;
protected float translateX = 0.0;
protected float translateY = 0.0;

String data[];
Student students[];
Group groups[];

int leftCornerX = 300; // X-value of rect
int leftCornerY = 50; // Y-value of rect
int skillAcc = 0; // Accumulated skill-value (width of rect)
int heightY = 10; // Height of rect


int[] display = {leftCornerX, leftCornerY, skillAcc, heightY};

Helper helper;


private boolean locked = false;

private float xOffset;
private float yOffset;

void setup(){
  
  size(1200, 800);
  
  // Import student data
  data = loadStrings("data/personalsurvey.csv");
  students = new Student[data.length];
  
  helper = new Helper();
  
  // Creates new students and puts them in an array
  for (int i = 0; i < data.length; i++){
      students[i] = new Student(data[i], "Student " + str(i), display, i, helper);
  }
  
  int totalStudents = data.length;
  int totalGroups = totalStudents / 6;
  groups = new Group[totalGroups];
  
  for(int i = 0; i < totalGroups; i++){
    groups[i] = new Group(1000, 50 + (i * 140), i);
  }
  
  helper.setNotOverStudentCountTOTAL(totalStudents);
  
}

 
void draw(){ 
  //Canvas color
  background(255);
  
  pushMatrix();
  
  translate(translateX,translateY);
  
  scale(scaleFactor);
  
  displayGroups();
  displayStudents();
  helper.setOverStudent();
  
  println(helper.getLeftCornerX() + " " + helper.getY());
  
  popMatrix();
  
  //println(helper.getLeftCornerX() + " " + helper.getY());
  
}

void mouseDragged(MouseEvent e) {
  
  if (!locked){
     helper.setDragged(false);
     translateX += mouseX - pmouseX;
     translateY += mouseY - pmouseY;
     //println(translateX +"    " + translateY + "   " + scaleFactor);
     helper.updateChange(translateX, translateY);
     
  }
  else {
      helper.setDragged(true);
      helper.setNewLeftCornerX((helper.getMouseX()-xOffset));
      helper.setNewY((helper.getMouseY()-yOffset));
    //updateY();   
  }
}

void mouseWheel(MouseEvent e) {
  translateX -= mouseX;
  translateY -= mouseY;
  float delta = e.getCount() > 0 ? 1.05 : e.getCount() < 0 ? 1.0/1.05 : 1.0;
  scaleFactor *= delta;
  translateX *= delta;
  translateY *= delta;
  translateX += mouseX;
  translateY += mouseY;
  println(translateX +"    " + translateY + "   " + scaleFactor);
  helper.updateChange(translateX, translateY, scaleFactor);
  
}


void mousePressed(MouseEvent e){
    if (helper.isOverStudent()){
      locked = true;
      xOffset = helper.getMouseX()-helper.getNewLeftCornerX(); 
      yOffset = helper.getMouseY()-helper.getNewY();
      
    }
    else{
      locked = false;
    }
  }



void mouseReleased(MouseEvent e){
    if (locked){
      for(int i = 0; i < groups.length; i++){
         if (helper.onGroup(groups[i])){
             if(!groups[i].isGroupFull()){
               groups[i].addStudent(students[helper.getOverRectID()]);
             }
             else{
                 text("Group is Full!!", groups[i].getXPos() + 10, groups[i].getYPos() + 10);
             }
         }
      }
    }
    
    helper.setDragged(false);
    locked = false;
    xOffset = 0;
    yOffset = 0;
  }

void displayStudents(){
  helper.restoreNotOverStudentCount();
  for (int i = 0; i < students.length; i++){
    students[i].display();
  }
}

void displayGroups(){
  
  for(int i = 0; i < groups.length; i++){
    groups[i].displayGroup();
  }
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  