#ifndef DISCRETE_FILTER_H_INCLUDED
#define DISCRETE_FILTER_H_INCLUDED

#define DISCRETE_FILTER_MAX_DEPTH 12

class DiscreteFilter {
private:
	int 	_n;
	int		_counter;
	float   _x[DISCRETE_FILTER_MAX_DEPTH];
	float   _y[DISCRETE_FILTER_MAX_DEPTH];
	const float *_coeffA;
	const float *_coeffB;

	void increment(int &counter);

public:
	DiscreteFilter(int n, const float *coeffA, const float *coeffB);

	void clear();
	float update(float value);
};

#endif // DISCRETE_FILTER_H_INCLUDED
