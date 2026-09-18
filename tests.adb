pragma Ada_2022;
with Ada.Assertions; use Ada.Assertions;
with Ada.Text_IO; use Ada.Text_IO;
with Task_Termination_Demo;
procedure Tests is
begin
   Assert (Task_Termination_Demo.Handler_Saw_Normal);
   Put_Line ("PASS Task_Termination fall-back handler Normal");
   Put_Line ("All Task_Termination topic tests passed.");
end Tests;
