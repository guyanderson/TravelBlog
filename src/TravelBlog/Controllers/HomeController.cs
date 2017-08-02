using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TravelBlog.Models;
using Microsoft.EntityFrameworkCore;

namespace TravelBlog.Controllers
{
    public class HomeController : Controller
    {

        private TravelBlogContext db = new TravelBlogContext();
        public IActionResult Index()

        {
            return View(db.Trips.ToList());
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Trip trip)
        {
            db.Trips.Add(trip);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Edit(int id)
        {
            var thisTrip = db.Trips.FirstOrDefault(trips => trips.TripId == id);
            return View(thisTrip);
        }

        [HttpPost]
        public IActionResult Edit(Trip trip)
        {
            db.Entry(trip).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Delete(int id)
        {
            var thisTrip = db.Trips.FirstOrDefault(trips => trips.TripId == id);
            return View(thisTrip);
        }

        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(int id)
        {
            var thisTrip = db.Trips.FirstOrDefault(trips => trips.TripId == id);
            db.Trips.Remove(thisTrip);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Details(int id)
        {
         var thisTrip = db.Trips.FirstOrDefault(trips => trips.TripId == id);
          return View(thisTrip);
        }

    }
}
