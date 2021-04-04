/// @description Check for enemy death.

// Check for enemy death.
if (eHP <= 0)
{
	instance_deactivate_object(self);
}