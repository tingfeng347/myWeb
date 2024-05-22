package bean;

public class Student {
    String sno;
    String name;
    int age;
    String sex;
    double height;
    double Weight;
    int fhl;
    double tqq;

    public Student() {

    }

    public Student(String sno, String name) {
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWeight() {
        return Weight;
    }

    public void setWeight(double weight) {
        Weight = weight;
    }

    public int getFhl() {
        return fhl;
    }

    public void setFhl(int fhl) {
        this.fhl = fhl;
    }

    public double getTqq() {
        return tqq;
    }

    public void setTqq(double tqq) {
        this.tqq = tqq;
    }


    public Student(String sno, String name, int age, String sex, double height, double weight, int fhl, double tqq) {
        this.sno = sno;
        this.name = name;
        this.age = age;
        this.sex = sex;
        this.height = height;
        Weight = weight;
        this.fhl = fhl;
        this.tqq = tqq;
    }
}
