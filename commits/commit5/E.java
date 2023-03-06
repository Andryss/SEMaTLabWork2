class E extends D {
  public E() {
    t20 = 1;
    t1 = 9;
    t22 = 4L;
    t27 = 2L;
  }
  public void t18() {
    System.out.println("метод t18 в классе E");
    System.out.println(t16 - 5);
  }
  public void t2() {
    System.out.println("метод t2 в классе E");
    System.out.println(t20--);
  }
  public void t4() {
    System.out.println("метод t4 в классе E");
    System.out.println(t20 - 4);
  }
  public static void t37() {
    System.out.println("метод t37 в классе E");
    System.out.println((t25 - 3));
  }
  public static void t14() {
    System.out.println("метод t14 в классе E");
    System.out.println(t25++);
  }
  public static void t34() {
    System.out.println("метод t34 в классе E");
    System.out.println(t29);
  }
  public static void t12() {
    System.out.println("метод t12 в классе E");
    System.out.println((t29 - 1));
  }
  public void t8(D r) {
    r.t17();
  }
  public void t8(E r) {
    r.t2();
  }
}
