


class Group{
  
  private Student[] groupMembers = new Student[6];
  private float members = 0;
  
  private int infoVisSkill = 0;
  private int statsSkill = 0;
  private int mathSkill = 0;
  private int artisticSkill = 0;
  private int computerUsageSkill = 0;
  private int programmingSkill = 0;
  private int graphicsProgSkill = 0;
  private int hciSkill = 0;
  private int evaluationSkill = 0;
  
  
  private int xPos;
  private int yPos;
  private int groupID;
  private int skillAmp = 10;
  private int skillHeight = 10;
  
  private int gWidth = 100;
  private int gHeight = 112;
  
  public Group(int x, int y, int id){
    xPos = x;
    yPos = y;
    groupID = id;
    
  }
  
  void addStudent(Student student){
    updateGroupSkill(student); // If the new student has better skills, set that as group skill.
    addAtArrayPosition(student);
    attachStudent(student);
    members += 1;
    
  }
  
  void removeStudent(int id){
    Student[] copyGroupMembers = new Student[6];
    for (int i = 0; i < groupMembers.length; i++){
      if (id != groupMembers[i].getID()){
        copyGroupMembers[i] = groupMembers[i];
      }
    }
    groupMembers = copyGroupMembers;
    members -= 1;
    
    for (int i = 0; i < groupMembers.length; i++){
      if (groupMembers[i] instanceof Student){
            updateGroupSkill(groupMembers[i]);
      }
    }
    
  }
  
  void attachStudent(Student student){
    int xAttach = (int) (xPos + gWidth);
    int yAttach = (int) (yPos + (12*members));
    student.attachToGroup(xAttach, yAttach);
    
  }
  
  void checkMembers(){
    for (int i = 0; i < members; i++){
      if (groupMembers[i] instanceof Student){
        if(groupMembers[i].getX() != xPos + gWidth){
          removeStudent(groupMembers[i].getID());
        }
      }
    }
  }
  
  
  void displayGroup(){
    checkMembers();
    fill(0);
    text("Group " + groupID, xPos, yPos - 10);
    noFill();
    rect(xPos, yPos, gWidth, gHeight);
    displayGroupStats();
    
  }
  
  void displayGroupStats(){
    
    fill(color(235, 16, 16));
    rect(xPos, yPos + 2, infoVisSkill * skillAmp, skillHeight);
   
    fill(color(241, 247, 69));
    rect(xPos, yPos + 14, statsSkill * skillAmp, skillHeight);
    
    fill(color(81, 41, 61));
    rect(xPos, yPos + 26, mathSkill * skillAmp, skillHeight);
    
    fill(color(41, 190, 270));
    rect(xPos, yPos + 38, artisticSkill * skillAmp, skillHeight);
    
    fill(color(142, 237, 217));
    rect(xPos, yPos + 50, computerUsageSkill * skillAmp, skillHeight);
    
    fill(color(34, 186, 54));
    rect(xPos, yPos + 62, programmingSkill * skillAmp, skillHeight);
    
    fill(color(145, 200, 152));
    rect(xPos, yPos + 74, graphicsProgSkill * skillAmp, skillHeight);
    
    fill(color(227, 93, 180));
    rect(xPos, yPos + 86, hciSkill * skillAmp, skillHeight);
    
    fill(color(181, 9, 61));
    rect(xPos, yPos + 98, evaluationSkill * skillAmp, skillHeight);
    
    noFill();
  }
  
  boolean isGroupFull(){
    if (members < 6){
      return false;
    }
    else {
      return true;
    }
  }
  
  int getXPos(){
    return xPos;
  }
  int getYPos(){
    return yPos;
  }
  
  int getWidth(){
    return gWidth;
  }
  int getHeight(){
    return gHeight;
  }
  
  void updateGroupSkill(Student student){
    if (student.getInfoVisSkill() > infoVisSkill){
      infoVisSkill = student.getInfoVisSkill();
    }
    if (student.getStatsSkill() > statsSkill){
      statsSkill = student.getStatsSkill();
    }
    if (student.getMathSkill() > mathSkill){
      mathSkill = student.getMathSkill();
    }
    if (student.getArtisticSkill() > artisticSkill){
      artisticSkill = student.getArtisticSkill();
    }
    if (student.getComputerUsageSkill() > computerUsageSkill){
      computerUsageSkill = student.getComputerUsageSkill();
    }
    if (student.getProgrammingSkill() > programmingSkill){
      programmingSkill = student.getProgrammingSkill();
    }
    if (student.getComputerUsageSkill() > computerUsageSkill){
      computerUsageSkill = student.getComputerUsageSkill();
    }
    if (student.getGraphicsProgSkill() > graphicsProgSkill){
      graphicsProgSkill = student.getGraphicsProgSkill();
    }
    if (student.getHCISkill() > hciSkill){
      hciSkill = student.getHCISkill();
    }
    if (student.getEvaluationSkill() > evaluationSkill){
      evaluationSkill = student.getEvaluationSkill();
    }
  }
  
  void addAtArrayPosition(Student student){
    for (int i = 0; i < groupMembers.length; i++){
      if (groupMembers[i] instanceof Student){
        groupMembers[i] = student;
        break;
      }
    }
  }
  
  
}