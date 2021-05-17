#include "include/push_swap.h"

void 	check_list(t_double_list *stack_a)
{
	while (stack_a != NULL)
	{
		if (stack_a->content < -2147483647 ||
				stack_a->content > 2147483647)
			print_error();
		stack_a = stack_a->next;
	}
}

void 	check_duplicates_list(char *str, char **argv, int i)
{
	int j;
	int value;

	j = 1;
	while (j < i)
	{
		if (ft_strlen(str) == ft_strlen(argv[j]))
		{
			value = ft_strncmp(str, argv[j], ft_strlen(str));
			if (value == 0)
				print_error();
		}
		j++;
	}
}

int		nb_is_decim(char *str)
{
	int i;

	i = 0;
	while (str[i] != '\0')
	{
		while (ft_isdigit(str[i]) == 1)
			i++;
		if (str[i] != ' ' && str[i] != '\0')
			print_error();
	}
	return (1);
}

void 	print_error()
{
	printf("Error\n");
	exit (0);
}
