package hkmu.wadd.model;


import jakarta.persistence.*;

@Entity
@Table(name = "course")
public class CourseEntry {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;


    public CourseEntry() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "CourseEntry{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
