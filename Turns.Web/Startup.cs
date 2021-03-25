using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Turns.Web.Areas.Administration.Controllers;
using Turns.Web.Areas.Appointment.Controllers;
using Turns.Web.Models;

namespace Turns.Web
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //String parameter = Configuration.GetValue<String>("WebApiUrl:EntityService");
            //ParameterConf confi = new ParameterConf();
            //confi.EntityService = parameter;
            services.AddOptions();
            services.Configure<ParameterConf>(Configuration);
            services.AddSingleton<EntityController>();
            services.AddSingleton<AppointmentController>();
            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });


            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);
            services.AddSingleton<IFileProvider>(new PhysicalFileProvider(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/Uploads/Video")));
            services.AddDistributedMemoryCache(); // Adds a default in-memory implementation of IDistributedCache
            services.AddSession();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
               
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }
            //app.MapSignalR("/signalr", new Microsoft.AspNet.SignalR.HubConfiguration());
            //var hubConfiguration = new HubConfiguration
            //{
            //    EnableDetailedErrors = true,
            //    EnableJavaScriptProxies = false
            //};
            //app.MapSignalR(hubConfiguration);

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseCookiePolicy();
            app.UseSession();
            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{Area=Security}/{controller=Account}/{action=login}/{id?}");
  
            });

        }
    }
}
