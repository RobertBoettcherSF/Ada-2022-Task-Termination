--  Ada 2022 topic: Ada.Task_Termination.
pragma Ada_2022;
package Task_Termination_Demo is
   --  Set a fall-back handler; spawn a short task; return True if
   --  the handler observed Normal termination.
   function Handler_Saw_Normal return Boolean;
end Task_Termination_Demo;
