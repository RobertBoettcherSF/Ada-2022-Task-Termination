pragma Ada_2022;

with Ada.Task_Identification;
with Ada.Task_Termination;
with Ada.Exceptions;

package body Task_Termination_Demo is

   package TT renames Ada.Task_Termination;
   package TI renames Ada.Task_Identification;

   protected Guard is
      procedure Handler
        (Cause : TT.Cause_Of_Termination;
         T     : TI.Task_Id;
         X     : Ada.Exceptions.Exception_Occurrence);
      procedure Reset;
      function Seen return Boolean;
   private
      Flag : Boolean := False;
   end Guard;

   protected body Guard is
      procedure Handler
        (Cause : TT.Cause_Of_Termination;
         T     : TI.Task_Id;
         X     : Ada.Exceptions.Exception_Occurrence)
      is
         pragma Unreferenced (T, X);
         use type TT.Cause_Of_Termination;
      begin
         if Cause = TT.Normal then
            Flag := True;
         end if;
      end Handler;

      procedure Reset is
      begin
         Flag := False;
      end Reset;

      function Seen return Boolean is
      begin
         return Flag;
      end Seen;
   end Guard;

   function Handler_Saw_Normal return Boolean is
   begin
      Guard.Reset;
      TT.Set_Dependents_Fallback_Handler (Guard.Handler'Access);
      declare
         task Worker;
         task body Worker is
         begin
            null;
         end Worker;
      begin
         null;  -- wait for Worker to terminate at end of declare
      end;
      delay 0.05;
      return Guard.Seen;
   end Handler_Saw_Normal;

end Task_Termination_Demo;
