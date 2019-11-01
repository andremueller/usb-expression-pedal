#include "DiscreteFilter.h"

void DiscreteFilter::increment(int &counter)
{
	counter = (counter + 1) % _n;
}

DiscreteFilter::DiscreteFilter(int n, const float *coeffA, const float *coeffB)
: _n(n),
  _counter(0),
  _coeffA(coeffA),
  _coeffB(coeffB)
{
	clear();
}

void DiscreteFilter::clear()
{
	_counter = 0;
	for (int i=0; i<_n; ++i) {
		_x[i] = 0.0f;
		_y[i] = 0.0f;
	}
}

float DiscreteFilter::update(float value)
{
	// a[1]*y[n] + a[2]*y[n-1] + … + a[n]*y[1] = b[1]*x[n] + b[2]*x[m-1] + … + b[m]*x[1]
	_x[_counter] = value;
	float y = 0.0f;

	int j = _counter;
	for (int i=_n-1; i>=0; --i) {
		increment(j);
		y += _coeffB[i] * _x[j];
	}

	j = _counter;
	for (int i=_n-1; i>=1; --i) {
		increment(j);
		y -= _coeffA[i] * _y[j];
	}
	_y[_counter] = y;
	increment(_counter);
	return y;
}
