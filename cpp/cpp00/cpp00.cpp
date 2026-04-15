/* C++ Cairo 00
2026-04-14

First sketch in C++ and first time messing with vector graphics. Done in one
day over an hour or two.

esmoore */
#include <cairo/cairo.h>
#include <cmath>
#include <cstdlib>
#include <ctime>

double r2() { return (double)rand() / (double)RAND_MAX; }

int main() {
  srand(time(NULL));
  int W = 800, H = 800;
  cairo_surface_t *surface =
      cairo_image_surface_create(CAIRO_FORMAT_ARGB32, W, H);
  cairo_t *cr = cairo_create(surface);

  cairo_set_source_rgb(cr, 0.05, 0.05, 0.08);
  cairo_paint(cr);

  for (int i = 0; i < 1000; ++i) {
    double x = 100 + (rand() % (W - 200));
    double y = 100 + rand() % (H - 200);
    double r = rand() % 60;

    if(x > 200 && y > 200 && abs(H-y-x) < 50){
      continue;
    }
    if (x > W/2 - 50 && x < W/2 + 50){
      cairo_set_source_rgba(cr, 0.3 + (rand() % 20) / 40.0, 0.4, 0.65, 0.2);
    }
    else if (y < x/2 || y > 2*x) {
      cairo_set_source_rgba(cr, 0.3 + (rand() % 20) / 40.0, 0.5, 0.8, 0.2);
    }
    else {
      cairo_set_source_rgba(cr, 0.3 + (rand() % 20) / 40.0, 0.3, 0.5, 0.2);
    }

    cairo_move_to(cr, x, y);
    cairo_arc(cr, x, y, r, 0, r2() * 2 * M_PI);
    cairo_fill(cr);
  }

  cairo_surface_write_to_png(surface, "out.png");

  cairo_destroy(cr);
  cairo_surface_destroy(surface);
}
