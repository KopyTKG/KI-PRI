<!DOCTYPE html>
<html lang="en">
<head>
    <title>Task 7.2</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="w-screen h-screen bg-slate-200 flex justify-center items-center">
    <!-- Ensure PHP is correctly handled and XSS prevention is considered -->
    <?php
        // Check if 'my-name' exists in the request and sanitize it to prevent XSS
        $myName = isset($_REQUEST['my-name']) ? htmlspecialchars($_REQUEST['my-name']) : '';
    ?>
    <!-- Center the form on the page both vertically and horizontally -->
    <form class="bg-stone-300 p-8 rounded-xl shadow-lg border border-stone-800 flex flex-col items-center gap-3" method="post" action="back-72.php">
        <div class="flex flex-row gap-4 items-center">
            <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
            <input type="text" id="name" name="name" value="<?= $myName ?>" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
	</div>
        <div class="flex flex-row gap-4 items-center">
            <label for="number" class="block text-sm font-medium text-gray-700">Number</label>
            <input type="number" id="number" name="number" value="<?= $number ?>" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
	</div>
	<div class="flex flex-row gap-4 items-center">
	    <label for="date" class="block text-sm font-medium text-gray-700">Date</label>
	    <input type="date" id="date" name="date" value="<?= $date ?>" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
	</div>
	
        <button type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Submit</button>
    </form>
</body>
</html>
