

class Helper{
  
  // Translation and scale changes. Used for calculating new mouse position in the student class.
  private float changeX = 0.0;
  private float changeY = 0.0;
  private float changeScale = 1.0;
  
  // New mouse coordinates
  private float newMouseX;
  private float newMouseY;
  
  // Coordinates of hoverd rect
  private int leftCornerX;
  private int Y;
  
  private boolean overStudent = false; // Is the mouse coordinates over a student?
  
  private int studentID = -1;
  
  private boolean dragged = false; // Is a student being dragged?
  
  private float newLeftCornerX;
  private float newY;
  
  
  private int notOverStudentCountTOTAL;
  private int notOverStudentCount = 0;
  
  // Updates the translated and scaled coordinates
  public void updateChange(float x, float y){
    changeX = x;
    changeY = y;
  }
  public void updateChange(float x, float y, float scale){
    changeX = x;
    changeY = y;
    changeScale = scale;
  }
  
  // Get the matrix translate change in X
  public float getChangeX(){
    return changeX;
  }
  
  // Get the matrix translate change in Y
  public float getChangeY(){
    return changeY;
  }
  
  // Get the matrix scale change
  public float getChangeScale(){
    return changeScale;
  }
  
  //Set the total number of students
  public void setNotOverStudentCountTOTAL(int students){
    notOverStudentCountTOTAL = students;
  }
  
  public void restoreNotOverStudentCount(){
    notOverStudentCount = 0;
  }
  
  // Adds to the counts of the number of students the mouse isn't hovering.
  public void addNotOverStudentCount(){
    notOverStudentCount += 1;
  }
  
  
  // Sets overStudent to true if no rect in any student is hovered by the mouse.
  public void setOverStudent(){
    if (notOverStudentCountTOTAL == notOverStudentCount){
      overStudent = false;
      restoreOverRect();
    }
    else{
      overStudent = true;
    }
  }
  
  // Is the mouse over a student?
  public boolean isOverStudent(){
    return overStudent;
  }
  
  
  // Sets or restores position of hovered rectangle
  public void setOverRect(int leftCornerX_, int Y_){
    leftCornerX = leftCornerX_;
    Y = Y_;
  }
  
  public void setOverRectID(int id){
    studentID = id;
  }
    
  public void restoreOverRect(){
    leftCornerX = 0;
    Y = 0;
  }
  public void restoreOverRectID(){
    studentID = -1;
  }
  
  public int getOverRectID(){
    return studentID;
  }
  
  public float getLeftCornerX(){
    return leftCornerX;
  }
  public float getY(){
    return Y;
  }
  
  
  public boolean onGroup(Group group){
    float newMouseX = getMouseX();
    float newMouseY = getMouseY();

    if(newMouseX >= group.getXPos() && newMouseX <= group.getXPos()+group.getWidth() &&
        newMouseY >= group.getYPos() && newMouseY <= group.getYPos()+group.getHeight()){
         return true;
     }
     else{
       return false;
     }
  }
  
  
  
  // Set and get new student corner coordinates
  public void setNewLeftCornerX(float mouseXoffset){
    newLeftCornerX = mouseXoffset;
  }
  public void setNewY(float mouseYoffset){
    newY = mouseYoffset;
  }
  
  public float getNewLeftCornerX(){
    return newLeftCornerX;
  }
  public float getNewY(){
    return newY;
  }
  
  
  
  
  
  // Dragged
  public boolean isDragged(){
    return dragged;
  }
  public void setDragged(boolean dragged_){
    dragged = dragged_;
  }
 
 
 
 
  // Gets the new Mouse coordinates from the helper
  public float getMouseX(){
    float changeX = helper.getChangeX();
    float changeScale = helper.getChangeScale();
    return (mouseX - changeX)*(1/changeScale);
    
  }
  
  public float getMouseY(){
    float changeY = helper.getChangeY();
    float changeScale = helper.getChangeScale();
    return (mouseY - changeY)*(1/changeScale);
    
  }
 
 
  
  // Gives new Mouse coordinates to the helper
  void setMouseX(float newMouseX_){
    newMouseX = newMouseX_;
  }
  void setMouseY(float newMouseY_){
    newMouseY = newMouseY_;
  }
  
}