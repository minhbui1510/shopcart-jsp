<%-- footer.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<footer class="bg-dark text-white mt-5 py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5>About Us</h5>
                <p>We offer high-quality products at affordable prices. Our mission is to provide the best shopping experience to our customers.</p>
            </div>
            <div class="col-md-4">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="${pageContext.request.contextPath}/products" class="text-white">Products</a></li>
                    <li><a href="#" class="text-white">About Us</a></li>
                    <li><a href="#" class="text-white">Contact Us</a></li>
                    <li><a href="#" class="text-white">Terms & Conditions</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Contact Information</h5>
                <address>
                    <strong>My Online Store</strong><br>
                    123 E-Commerce St.<br>
                    Web City, WC 12345<br>
                    <abbr title="Phone">P:</abbr> (123) 456-7890
                </address>
                <a href="mailto:info@myonlinestore.com" class="text-white">info@myonlinestore.com</a>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col text-center">
                <p class="mb-0">&copy; 2025 My Online Store. All rights reserved.</p>
            </div>
        </div>
    </div>
</footer>