package test;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

class Student {
    int id;
    String name;
    int age;

    public Student(int id, String name, int age) {
        this.id = id;
        this.name = name;
        this.age = age;
    }

}

public class ComparatorTest {

    public static void main(String[] args) {

        Comparator<Student> comparator = new Comparator<Student>() {
            @Override
            public int compare(Student o1, Student o2) {
                return o1.age - o2.age;
            }
        };

        List<Student> students = new ArrayList<>();
        students.add(new Student(1, "Rahul", 30));
        students.add(new Student(2, "Rohit", 26));
        Collections.sort(students, comparator);

        for(Student s : students) {
            System.out.println(s.age);
        }
    }

}
