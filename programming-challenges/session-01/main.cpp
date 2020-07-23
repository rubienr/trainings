#include <iostream>
#include <unordered_map>
#include <list>

using namespace std;

// --------------------------------------------------------------------
//#define VERBOSE // enable to see more things like hit rate, miss, hits, ...
#ifdef VERBOSE
int hits{0};
int miss{0};
#endif

// --------------------------------------------------------------------
// Collatz problem: iterative approach with caching of all intermediate results.
inline int cycle_length(int n)
{
  //#define VERBOSE_COLLATZ // define VERBOSE to see dump also the collatz sequence
  static unordered_map<int, int> cache;

  const int x = n;
  int cycles{1};

  list <int>n_list;
  list <int>cycle_list;
  int offset_on_chace_hit{0};

  while (n != 1) // otherwise we end in the cycle 4 2 1 4 2 1 ...
  {
#ifdef VERBOSE_COLLATZ
    cout << n;
#endif


    auto cache_iter {cache.find(n)};
    if (cache_iter != cache.end())
    {
#ifdef VERBOSE
      hits++;
#endif
      // imagine we calculate the colatz series and find the number cached, then we need to add this cycles to our current coputation:
      //                       cache hit
      //                       v
      // Collatz sequence [a b c d ... m]
      // cycles sequence  [1 2 3 4 ... n]
      //                       ^
      //                       offset = 3
      offset_on_chace_hit = cache_iter->second;
      break;
    }
    else
    {
#ifdef VERBOSE
      miss++;
#endif
      n_list.push_back(n);
      cycle_list.push_front(cycles);
    }

    cycles++;
    if ((n % 2) != 0) n = (n << 1) + n + 1; // = 3*n + 1;
    else n = n >> 1;                        // = n/2;
  }

  // publish saved n and cycles to the cache
  auto n_it = n_list.cbegin();
  auto c_it = cycle_list.cbegin();
  while (n_it != n_list.cend())
  {
    const int listed_n{*n_it};
    const int listed_cycle{*c_it};
    cache[listed_n] = listed_cycle + offset_on_chace_hit;
    n_it++;
    c_it++;
  }

  return cache[x];
}


// --------------------------------------------------------------------
int main(int, char **)
{
  int a, b;
  
  while (cin >> a >> b)
  {
    int n{0}, i, j;
    
    if (a < b) 
    {
      i = a;
      j = b;
    } 
    else 
    {
      i = b;
      j = a;
    }

    for (; i <= j; i++) 
    {  
      const int foo = cycle_length(i);
      n = (foo > n) ? foo : n;
    }

    cout << a << " " << b << " " << n + 1 << endl;
  }
  
  cout << flush;

#ifdef VERBOSE
  cout << "rate: " << (static_cast<float>(hits * 100)/(hits + miss)) << "% hits: " << hits << " miss: " << miss << " cache size: " << (miss + hits) << endl;
#endif

  return 0;
}
