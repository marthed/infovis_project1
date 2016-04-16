

class Student{
  
  private int infoVisSkill;
  private int statsSkill;
  private int mathSkill;
  private int artisticSkill;
  private int computerUsageSkill;
  private int programmingSkill;
  private int graphicsProgSkill;
  private int hciSkill;
  private int evaluationSkill;
  
  private String name;
  private int[] skills;
  private int id;
  
  private int leftCornerX; // X-value of rect
  private int leftCornerY; // Y-value of rect
  private int skillAcc; // Accumulated skill-value (width of rect)
  private int heightY; // Height of rect
  private int Y;
  private int skillAmp = 10;
  
  private int totalSkill = 0; // Combined skill of a student (width of student rect)
  
  
  private int leftCornerXOriginal; // Where is the student located in the beginning?
  private int leftCornerYOriginal;
  
  
  private Helper helper; // A reference to the helper class
  
  
  Student(String skills_, String name_, int[] display, int id_, Helper helper_){
    
    skills = int(split(skills_, ";"));
    name = name_;
    leftCornerX = display[0];
    leftCornerY = display[1];
    skillAcc = display[2];
    heightY = display[3]; 
    Y = leftCornerY + (heightY + 10) * id_;
    id = id_;
    
    helper = helper_;
    
    infoVisSkill = skills[0];
    statsSkill = skills[1];
    mathSkill = skills[2];
    artisticSkill = skills[3];
    computerUsageSkill = skills[4];
    programmingSkill = skills[5];
    graphicsProgSkill = skills[6];
    hciSkill = skills[7];
    evaluationSkill = skills[8];
    
    // Combined total skills (the width of the student rectangle).
    totalSkill = (infoVisSkill + statsSkill + mathSkill + artisticSkill + computerUsageSkill + programmingSkill + graphicsProgSkill +
    hciSkill + evaluationSkill) * skillAmp;
    
    // Coordinates of upper left corner for this student.
    leftCornerXOriginal = leftCornerX;
    leftCornerYOriginal = Y;
    
  }
  
  void display(){
    stroke(0);
    noFill();
    
    if(helper.isDragged() && helper.getOverRectID() == id){
      leftCornerX = (int) helper.getNewLeftCornerX();
      Y = (int) helper.getNewY();
    }
    
    
    if (overRect(leftCornerX + skillAcc, Y, infoVisSkill * skillAmp, heightY)){
      fill(color(0, 16, 16));
      rect(leftCornerX + skillAcc, Y, infoVisSkill * skillAmp, heightY);
      
      //displayText(leftCornerX + skillAcc, Y);
      
    }
    else{
       fill(color(235, 16, 16));
       rect(leftCornerX + skillAcc, Y, infoVisSkill * skillAmp, heightY);
    }
    skillAcc += infoVisSkill * skillAmp;
    
    fill(color(241, 247, 69));
    rect(leftCornerX + skillAcc, Y, statsSkill * skillAmp, heightY);
    skillAcc += statsSkill * skillAmp;
    
    fill(color(81, 41, 61));
    rect(leftCornerX + skillAcc, Y, mathSkill * skillAmp, heightY);
    skillAcc += mathSkill * skillAmp;
    
    fill(color(41, 190, 270));
    rect(leftCornerX + skillAcc, Y, artisticSkill * skillAmp, heightY);
    skillAcc += artisticSkill * skillAmp;
    
    fill(color(142, 237, 217));
    rect(leftCornerX + skillAcc, Y, computerUsageSkill * skillAmp, heightY);
    skillAcc += computerUsageSkill * skillAmp;
    
    fill(color(34, 186, 54));
    rect(leftCornerX + skillAcc, Y, programmingSkill * skillAmp, heightY);
    skillAcc += programmingSkill * skillAmp;
    
    fill(color(145, 200, 152));
    rect(leftCornerX + skillAcc, Y, graphicsProgSkill * skillAmp, heightY);
    skillAcc += graphicsProgSkill * skillAmp;
    
    fill(color(227, 93, 180));
    rect(leftCornerX + skillAcc, Y, hciSkill * skillAmp, heightY);
    skillAcc += hciSkill * skillAmp;
    
    fill(color(181, 9, 61));
    rect(leftCornerX + skillAcc, Y, evaluationSkill * skillAmp, heightY);
    skillAcc += evaluationSkill * skillAmp;
    
    skillAcc = 0;
    
    
    
  }
  
  void displayText(int x, int y){
      fill(0, 102, 153);
      rotate(-PI/3.0);
      textSize(28);
      //text("Testing", x, y + 20);
      rotate(PI/3.0);
  }
 
  private int getX(){
    return leftCornerX;
  }
  
  
  // Checks if mouse is over a rectangle area.
  private boolean overRect(float x, float y, int w, int h) {
    float newMouseX = helper.getMouseX();
    float newMouseY = helper.getMouseY();
  
    if(newMouseX >= x && newMouseX <= x+w &&
        newMouseY >= y && newMouseY <= y+h){
        
        if (!helper.isDragged()){
          helper.setOverRect(leftCornerX, leftCornerYOriginal); // Sends entire student rect (not hovered skill)
          helper.setOverRectID(id);
        }
        return true;
    }
    else {
      
      helper.addNotOverStudentCount();
      return false;
      }
    }
  
  
  void attachToGroup(int x, int y){
    leftCornerX = x;
    Y = y;
  }
  
  // Get all the skills and ID of student, one-by-one.
  private int getSkill(int i){
    return skills[i];
  }
  private int getInfoVisSkill(){
    return infoVisSkill;
  }
  private int getStatsSkill(){
    return statsSkill;
  }
  private int getMathSkill(){
    return mathSkill;
  }
  private int getArtisticSkill(){
    return artisticSkill;
  }
  private int getComputerUsageSkill(){
    return computerUsageSkill;
  }
  private int getProgrammingSkill(){
    return programmingSkill;
  }
  private int getGraphicsProgSkill(){
    return graphicsProgSkill;
  }
  private int getHCISkill(){
    return hciSkill;
  }
  private int getEvaluationSkill(){
    return evaluationSkill;
  }
  private int getID(){
    return id;
  }
  
}