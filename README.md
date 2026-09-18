# Task_Termination in Ada 2022

Teaching sheet for `Ada.Task_Termination`. No SPARK. Wave 21.

Demonstrates `Set_Dependents_Fallback_Handler` with a protected procedure that observes `Cause_Of_Termination = Normal` when a dependent task finishes.

```bash
make && make test
```
