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
    public class ExperienceController : Controller
    {
        private TravelBlogContext db = new TravelBlogContext();
        public IActionResult Index()
        {
            return View(db.Experiences.Include(experiences => experiences.Location).ToList());
        }

        public IActionResult Details(int id)
        {
            List<Experience> thisExperience = db.Experiences.Where(exp => exp.LocationId == id).ToList();
            return View(thisExperience);
        }
    }
}

