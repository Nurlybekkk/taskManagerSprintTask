package kz.nurlybek.bitlab.javaEE.servletTasks.database;

import java.util.ArrayList;

public class DBManager {

    private static final ArrayList<Tasks> tasks = new ArrayList<>();
    private static Long id = 4L;

    static {
        tasks.add(new Tasks(1L,"homeworks","do lab 6-7 from CSA", "2023-04-21", "No"));
        tasks.add(new Tasks(2L,"bitlab sprint task","to finish sprint task today", "2023-04-23", "No"));
        tasks.add(new Tasks(3L,"team building","be happy all day", "2023-04-29", "No"));
    }

    public static void addTask(Tasks task){
        task.setId(id);
        tasks.add(task);
        id++;
    } //этот метод добавляет новую задачу в список

    public static Tasks getTask(Long id){
        return tasks.stream().filter(task -> task.getId() == id).findFirst().orElse(null);
    } // этот метод возвращает объект задачи по id

    public static ArrayList<Tasks> getAllTasks(){
        return tasks;
    } //этот метод возвращает список всех задач

    public static void deleteTask(Long id){
        for (int i = 0; i < tasks.size(); i++) {
            if (tasks.get(i).getId() == id){
                tasks.remove(i);
                break;
            }
        }
    } //этот метод удаляет задачу из списка по id

    public static void updateTask(Tasks zadacha){
        for (int i = 0; i < tasks.size(); i++) {
            if (tasks.get(i).getId() == zadacha.getId()){
                tasks.set(i, zadacha);
                break;
            }
        }
    }

}
