/* C++ Cairo 01
2026-04-16

Bubble Sort: A simple but inefficient comparison-based sorting algorithm. Named
for the way that large elements 'bubble' up to the top of the list.

esmoore */

#include <cairo/cairo.h>
#include <cstdlib>
#include <ctime>
#include <utility>
#include <vector>

constexpr int W = 800;
constexpr int H = 800;
constexpr int MW = 100;
constexpr int MH = 200;
constexpr int SIZE = 100;

constexpr int CW = W - 2 * MW;
constexpr int BW = CW / SIZE;

void draw_event(std::vector<int> &arr, cairo_t *cr, int i, bool swapped) {
  int dot_x = MW + BW * i + BW / 2;
  int dot_y = H - MH;
  if (swapped) {
    cairo_set_source_rgba(cr, 0.95, 0.85, 0.6, 0.7);
    cairo_arc(cr, dot_x, dot_y - arr[i], 10, 0, 2 * M_PI);
    cairo_fill(cr);
  } else {
    cairo_set_source_rgba(cr, 0.95, 0.5, 0.5, 0.4);
    cairo_arc(cr, dot_x, dot_y - arr[i + 1], 10, 0, 2 * M_PI);
    cairo_fill(cr);
  }
}

void draw_chart(std::vector<int> &arr, cairo_t *cr, double a) {
  cairo_set_source_rgba(cr, 0.05, 0.05, 0.05, a);
  for (int i = 0; i < arr.size(); ++i) {
    int bar_x = MW + i * BW;
    cairo_rectangle(cr, bar_x, H - MH - arr[i], BW - 1, arr[i]);
    cairo_fill(cr);
  }
}

void bsort(std::vector<int> &arr, cairo_t *cr) {
  for (int i = 0; i < arr.size() - 1; ++i) {
    for (int j = 0; j < arr.size() - i - 1; ++j) {
      if (arr[j] > arr[j + 1]) {
        draw_event(arr, cr, j, true);
        std::swap(arr[j], arr[j + 1]);
      } else {
        draw_event(arr, cr, j, false);
      }
    }
  }
}

int main() {
  srand(time(NULL));
  cairo_surface_t *surface =
      cairo_image_surface_create(CAIRO_FORMAT_ARGB32, W, H);
  cairo_t *cr = cairo_create(surface);

  cairo_set_source_rgb(cr, 0.95, 0.95, 0.95);
  cairo_paint(cr);

  std::vector<int> arr(SIZE);
  for (int &i : arr) {
    i = 1 + rand() % 399;
  }

  draw_chart(arr, cr, 0.05);
  bsort(arr, cr);

  cairo_surface_write_to_png(surface, "out.png");
  cairo_destroy(cr);
  cairo_surface_destroy(surface);
}
