/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: llescure <llescure@42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/10/17 23:15:29 by llescure          #+#    #+#             */
/*   Updated: 2021/05/06 15:38:06 by llescure         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../include/libft.h"

int		ft_find_size(long n)
{
	int compt;

	compt = 0;
	if (n <= 0)
	{
		n = n * -1;
		compt++;
	}
	while (n > 0)
	{
		n = n / 10;
		compt++;
	}
	return (compt);
}

char	*ft_itoa(int n)
{
	char		*rslt;
	long		store;
	int			i;
	int			j;

	store = n;
	if (!(rslt = malloc(sizeof(char) * ft_find_size(n) + 1)))
		return (NULL);
	i = ft_find_size(n) - 1;
	j = 0;
	if (store < 0)
	{
		rslt[j] = '-';
		store = store * -1;
		j++;
	}
	while (i >= j)
	{
		rslt[i] = '0' + store % 10;
		store = store / 10;
		i--;
	}
	rslt[ft_find_size(n)] = '\0';
	return (rslt);
}
