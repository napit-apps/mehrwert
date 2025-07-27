---
layout: training
header_image: "/assets/images/banner/green-training-2.avif"
title: gsp_training.title
description: gsp_training.description
cta-title: gsp_training.cta.title
cta-action: gsp_training.cta.action
---

{% include page_header.html %}
{% assign gsp_training = site.translations[site.lang].gsp_training %}

<!-- Training Start -->
<section class="service-main section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="text-color mb-4 mt-3"> {{ gsp_training.relevance.title }} </h3>
				<p class="text-white">{{ gsp_training.relevance.description }} </p>
			</div>
		</div>
		<div class="row justify-content-center">
			{% for item in gsp_training.relevance.item %}
			<div class="col-lg-4 col-md-12">
				<div class="service-item mb-4 mb-lg-0">
					<h4 class="my-4 text-color">{{ item.name }}</h4>
					<p class="text-white"> {{ item.content }} </p>
				</div>
			</div>
			{% endfor %}
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-12 mb-4 mt-3">
				<p class="text-white text-center">{{ gsp_training.relevance.footer }} </p>
			</div>
		</div>
	</div>
</section>

<section class="service-main section bg-white">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12 text-center">
				<h3 class="text-color mb-4 mt-3"> {{ gsp_training.overview.title }} </h3>
				<p class="">{{ gsp_training.overview.intro }} </p>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-12 ">
				<h4 class="my-4 text-color text-center">{{ gsp_training.overview.subtitle }}</h4>
				<ul class="list-training mt-4 mb-5">
				{% for item in gsp_training.overview.item %}
				<li>{{ item.text }}</li>
				{% endfor %}
				</ul>
			</div>
		</div>
	</div>
</section>

<section class="position-relative section-sm bg-primary">
	<!-- <img <img src="{{ gsp_training.banner.image }}" alt="" class="overlay-shape">"> -->
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12 mb-5 mb-lg-0 text-center">
				<h2 class="text-white mb-0">{{ gsp_training.banner.text }}</h2>
			</div>
		</div>
	</div>
</section>

<!-- <section class="service-main section ">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-4 col-md-6">
				<div class="service-item mb-4 text-center px-4 py-5">
					<i class="ti-comments text-color icon-md"></i>
					<h4 class="my-4 text-color">Interaktive Sessions</h4>
					<p class="text-white">Profitieren Sie von Live-Diskussionen und Gruppenarbeiten, die Online-Formate nur schwer bieten können.</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 border-left">
				<div class="service-item mb-4 text-center px-4 py-5">
					<i class="ti-hand-open text-color icon-md"></i>
					<h4 class="my-4 text-color">Praxisnahe Anwendung</h4>
					<p class="text-white">Erleben Sie Hands-on Übungen und reale Fallstudien, die Ihnen helfen, Konzepte sofort in die Praxis umzusetzen.</p>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="service-item mb-4 text-center px-4 py-5">
					<i class="ti-world text-color icon-md"></i>
					<h4 class="my-4 text-color">Networking</h4>
					<p class="text-white">Knüpfen Sie wertvolle Kontakte zu Branchenkollegen und Experten.</p>
				</div>
			</div>
		</div>
	</div>
</section>  -->

<section class="service-main section bg-white">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12 text-center">
				<h3 class="text-color mb-4 mt-3"> {{ gsp_training.faq.title }} </h3>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<table class="faq-table">
					{% for item in gsp_training.faq.item %}
					<tr class="faq-question">
						<td>{{ item.question }} <i class="ti-arrow-down"></i></td>
					</tr>
					<tr class="faq-answer">
						<td>{{ item.answer }}</td>
					</tr>
					{% endfor %}
				</table>
			</div>
		</div>
	</div>
</section>

<!-- Testimonial Start -->
<section class="section bg-secondary position-relative">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<span class="h5 text-color text-uppercase">
					{{ gsp_training.testimonials.subtitle }}
				</span>
				<h3 class="mb-4 mt-2 text-white">{{ gsp_training.testimonials.title }}</h3>
			</div>
		</div>
		<div class="row testimonial-wrap">
			{% for item in gsp_training.testimonials.item %}
				<div class="col-lg-12 ">
				<div class="test-wrap ">
					<i class="text-color ti-quote-left"></i>
					<div class="testimonial-content">
						<p class="text-white"> {{ item.text }} </p>
						<a class="text-color" href="{{ item.link }}" target="_blank">
						<div class="test-author d-flex mt-4">
							<div>
								<img src="{{ item.image }}" alt="" class="img-fluid mr-3">
							</div>
							<div>
								<h5 class="mb-0 mt-2 text-white">{{ item.name }}</h5>
								<span class="text-color"> {{ item.role }} </span>
							</div>
						</div>
						</a>
					</div>
				</div>
			</div>
			{% endfor %}
		</div>
	</div>
</section>
<!-- Testimonial End -->

<!-- Pricing Start -->
<section class="section pricing bg_secondary">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 text-center">
				<span class="h5 text-color text-uppercase">
					{{ gsp_training.pricing.subtitle }}
				</span>
				<h3 class="mb-5 mt-2">{{ gsp_training.pricing.title }}</h3>
			</div>
		</div>
		<div class="row">
			{% for item in gsp_training.pricing.item %}
				<div class="col-lg-4 col-md-6 ">
				<div class="card border-0 rounded-0 shadow-lg text-center p-4 mb-5 mb-lg-0 {{ item.background }}">
					<div class="card-header">
						<span class="package d-inline-block text-capitalize">{{ item.title }}</span>
						<!-- <h3 class="price mt-4 font-weight-bold">{{ item.price }} <small class="text-secondary text-sm"> {{ gsp_training.pricing.price-unit }}</small></h3> -->
						<p>{{ item.duration }}</p>
						<p>{{ item.location }}</p>
						<p>{{ item.participants }}</p>
					</div>
					<div class="card-body">
						<ul class="list-unstyled lh-45 mt-3 mb-4">
							<li>{{ item.content-1 }}</li>
							<li>{{ item.content-2 }}</li>
							<li class="text-muted"><li>{{ item.content-3 }}</li></li>
						</ul>
					</div>
				</div>
			</div>
			{% endfor %}
		</div>
	</div>
</section>
<!-- Pricing End -->
