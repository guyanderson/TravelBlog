using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TravelBlog.Models;

namespace TravelBlog.Controllers
{
    public class LocationController : Controller
    {
        private TravelBlogContext db = new TravelBlogContext();
        public IActionResult Index()
        {
            return View(db.Locations.Include(locations => locations.Trip).ToList());
        }

        //Details returns experiences?
        public IActionResult Details(int id)
        {
            //var thisLocation = db.Locations.FirstOrDefault(locations => locations.LocationId == id);
            //var thisLocation = (db.Locations.Select(locations => locations.LocationId == id).ToList());
            List<Location> thisLocation = db.Locations.Where(x => x.TripId == id).ToList();
            return View(thisLocation);
        }

    }
}
