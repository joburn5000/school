int main()
{
	int i = 0;
	volatile unsigned int *LED_PIO = (unsigned int*)0x70;
	volatile unsigned int *SW_PIO = (unsigned int*)0x60;
	volatile unsigned int *button = (unsigned int*)0x50;


	*LED_PIO = 0;
	volatile unsigned int sum = 0;
	int ready;

	while ((1+1) != 3)
	{
		/*
		if(*button == 0) //both
		{

		}
		if(*button == 1 && ready == 1) //add
		{
			sum = sum + *SW_PIO;
			ready = 0;
		}
		if(*button == 2 && ready == 1) //reset
		{
			sum = 0;
			ready = 0;
		}
		if(*button == 3) //neither
		{
			ready = 1;
		}
		*LED_PIO = sum;
 		*/
 		for(i = 0; i < 100000; i++);
		*LED_PIO |= 0x1;
		for(i = 0; i < 100000; i++);
		*LED_PIO &= ~0x1;
	}
	return 1;
}
