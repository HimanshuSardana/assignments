"use client";

import React, { useState } from "react";
import {
	UploadCloud,
	FileText,
	Send,
	Loader2,
	AlertCircle,
	CheckCircle2,
	BarChart3,
} from "lucide-react";
import { motion, AnimatePresence } from "framer-motion";

export default function TopsisPage() {
	const [file, setFile] = useState<File | null>(null);
	const [email, setEmail] = useState("");
	const [weights, setWeights] = useState("");
	const [impacts, setImpacts] = useState("");
	const [loading, setLoading] = useState(false);
	const [result, setResult] = useState<any[] | null>(null);
	const [error, setError] = useState<string | null>(null);

	const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
		if (e.target.files && e.target.files[0]) {
			setFile(e.target.files[0]);
			setError(null);
		}
	};

	const handleSubmit = async (e: React.FormEvent) => {
		e.preventDefault();
		if (!file || !weights || !impacts || !email) {
			setError("Please fill in all fields.");
			return;
		}

		setLoading(true);
		setError(null);
		setResult(null);

		const formData = new FormData();
		formData.append("file", file);
		formData.append("weights", weights);
		formData.append("impacts", impacts);
		formData.append("email", email);

		try {
			const response = await fetch("http://himanshu.co:5000/upload", {
				method: "POST",
				body: formData,
			});

			if (!response.ok) {
				const errorText = await response.text();
				throw new Error(errorText || "Failed to process request");
			}

			const data = await response.json();
			setResult(data);
		} catch (err: any) {
			setError(err.message);
		} finally {
			setLoading(false);
		}
	};

	const containerVariants = {
		hidden: { opacity: 0 },
		visible: {
			opacity: 1,
			transition: {
				staggerChildren: 0.1,
				delayChildren: 0.2,
			},
		},
	};

	const itemVariants = {
		hidden: { y: 20, opacity: 0 },
		visible: {
			y: 0,
			opacity: 1,
			transition: { duration: 0.5, ease: "easeOut" },
		},
	};

	return (
		<main className="min-h-screen bg-neutral-950 text-neutral-200 selection:bg-neutral-800 selection:text-white overflow-hidden relative font-sans">
			{/* Background Texture Hint */}
			<div className="absolute inset-0 z-0 pointer-events-none">
				<div className="absolute inset-0 bg-[radial-gradient(circle_at_center,_var(--tw-gradient-stops))] from-neutral-900/20 via-neutral-950 to-neutral-950" />
			</div>

			<div
				className={`container mx-auto px-6 py-12 relative z-10 transition-all duration-700 ease-[0.22,1,0.36,1] ${result ? "max-w-7xl" : "max-w-3xl"}`}
			>
				<div
					className={`grid gap-12 lg:gap-20 transition-all duration-700 ease-[0.22,1,0.36,1] ${result ? "grid-cols-1 lg:grid-cols-2" : "grid-cols-1"}`}
				>
					{/* Left Column: Form Section */}
					<motion.div
						layout
						className="mt-12 md:mt-20 flex flex-col gap-10"
						variants={containerVariants}
						initial="hidden"
						animate="visible"
						transition={{ duration: 0.6, type: "spring", bounce: 0 }}
					>
						{/* Header Section */}
						<div className="space-y-4">
							<motion.div variants={itemVariants}>
								<h1 className="text-4xl md:text-6xl font-bold tracking-tight text-white">
									topsis <span className="text-neutral-600">calculator.</span>
								</h1>
							</motion.div>

							<motion.div variants={itemVariants}>
								<h2 className="text-lg md:text-xl font-medium text-neutral-400 leading-relaxed max-w-xl">
									a tool for multi-criteria decision making. upload your
									dataset, define weights, and get{" "}
									<span className="text-neutral-200 decoration-neutral-700 underline underline-offset-4 decoration-1">
										ranked results
									</span>{" "}
									instantly.
								</h2>
							</motion.div>
						</div>

						<motion.hr
							variants={{
								hidden: { scaleX: 0, originX: 0, opacity: 0 },
								visible: {
									scaleX: 1,
									opacity: 1,
									transition: { duration: 0.8, ease: "circOut" },
								},
							}}
							className="border-neutral-800"
						/>

						{/* Form Section */}
						<motion.div variants={itemVariants}>
							<form onSubmit={handleSubmit} className="space-y-8">
								{/* File Upload - Minimalist */}
								<div className="group relative">
									<label className="block text-sm font-medium text-neutral-500 mb-2 lowercase">
										dataset (csv/xlsx)
									</label>
									<div
										className={`relative border border-dashed rounded-lg p-8 transition-all duration-300 ease-in-out flex flex-col items-center justify-center text-center cursor-pointer
                      ${file
												? "border-neutral-500 bg-neutral-900/30"
												: "border-neutral-800 hover:border-neutral-600 hover:bg-neutral-900/20"
											}`}
									>
										<input
											type="file"
											accept=".csv, .xlsx"
											onChange={handleFileChange}
											className="absolute inset-0 w-full h-full opacity-0 cursor-pointer"
										/>
										{file ? (
											<div className="flex items-center gap-3 text-neutral-200">
												<CheckCircle2 size={18} className="text-emerald-500" />
												<span className="text-sm font-medium font-mono">
													{file.name}
												</span>
											</div>
										) : (
											<div className="flex flex-col items-center gap-2">
												<UploadCloud
													size={20}
													className="text-neutral-600 group-hover:text-neutral-400 transition-colors"
												/>
												<span className="text-sm text-neutral-500 group-hover:text-neutral-400">
													drop file here
												</span>
											</div>
										)}
									</div>
								</div>

								{/* Inputs Grid */}
								<div className="grid grid-cols-1 md:grid-cols-2 gap-6">
									<div className="space-y-2">
										<label className="text-sm font-medium text-neutral-500 lowercase">
											weights
										</label>
										<input
											type="text"
											placeholder="e.g. 1, 2, 3, 4"
											value={weights}
											onChange={(e) => setWeights(e.target.value)}
											className="w-full bg-transparent border-b border-neutral-800 py-2 text-neutral-200 placeholder:text-neutral-700 focus:outline-none focus:border-neutral-500 transition-colors text-sm font-mono"
										/>
									</div>
									<div className="space-y-2">
										<label className="text-sm font-medium text-neutral-500 lowercase">
											impacts
										</label>
										<input
											type="text"
											placeholder="e.g. +, -, +, +"
											value={impacts}
											onChange={(e) => setImpacts(e.target.value)}
											className="w-full bg-transparent border-b border-neutral-800 py-2 text-neutral-200 placeholder:text-neutral-700 focus:outline-none focus:border-neutral-500 transition-colors text-sm font-mono"
										/>
									</div>
								</div>

								<div className="space-y-2">
									<label className="text-sm font-medium text-neutral-500 lowercase">
										email
									</label>
									<input
										type="email"
										placeholder="hello@example.com"
										value={email}
										onChange={(e) => setEmail(e.target.value)}
										className="w-full bg-transparent border-b border-neutral-800 py-2 text-neutral-200 placeholder:text-neutral-700 focus:outline-none focus:border-neutral-500 transition-colors text-sm"
									/>
								</div>

								{/* Error State */}
								{error && (
									<motion.div
										initial={{ opacity: 0, y: -10 }}
										animate={{ opacity: 1, y: 0 }}
										className="flex items-center gap-2 text-red-400 text-sm bg-red-950/30 p-3 rounded border border-red-900/50"
									>
										<AlertCircle size={14} />
										<span>{error}</span>
									</motion.div>
								)}

								{/* Action */}
								<button
									type="submit"
									disabled={loading}
									className="group relative inline-flex items-center justify-center gap-2 px-6 py-3 text-sm font-medium text-black bg-neutral-200 rounded hover:bg-white transition-colors disabled:opacity-50 disabled:cursor-not-allowed w-full md:w-auto"
								>
									{loading ? (
										<>
											<Loader2 size={16} className="animate-spin" />
											<span>processing</span>
										</>
									) : (
										<>
											<span>calculate</span>
											<Send
												size={14}
												className="group-hover:translate-x-0.5 transition-transform"
											/>
										</>
									)}
								</button>
							</form>
						</motion.div>
					</motion.div>

					{/* Right Column: Results Section */}
					<AnimatePresence>
						{result && (
							<motion.div
								initial={{ opacity: 0, x: 20 }}
								animate={{ opacity: 1, x: 0 }}
								exit={{ opacity: 0, x: 20 }}
								transition={{ duration: 0.5, delay: 0.2 }}
								className="lg:mt-20 pt-1 flex flex-col h-full"
							>
								<div className="space-y-6 sticky top-8">
									<div className="flex items-center justify-between border-b border-neutral-800 pb-2">
										<div className="flex items-center gap-2 text-neutral-300">
											<BarChart3 size={18} />
											<span className="font-medium">results.</span>
										</div>
										<span className="text-xs text-neutral-600 font-mono">
											{result.length} rows
										</span>
									</div>

									<div className="overflow-x-auto rounded-lg border border-neutral-900 bg-neutral-950/50 backdrop-blur-sm">
										<table className="w-full text-sm text-left">
											<thead className="text-xs text-neutral-500 lowercase border-b border-neutral-800 bg-neutral-900/20">
												<tr>
													{Object.keys(result[0] || {}).map((key) => (
														<th
															key={key}
															className="px-4 py-3 font-normal whitespace-nowrap"
														>
															{key}
														</th>
													))}
												</tr>
											</thead>
											<tbody className="divide-y divide-neutral-900">
												{result.map((row, idx) => (
													<motion.tr
														key={idx}
														initial={{ opacity: 0, x: -10 }}
														animate={{ opacity: 1, x: 0 }}
														transition={{ delay: 0.3 + idx * 0.05 }}
														className="hover:bg-neutral-900/50 transition-colors"
													>
														{Object.values(row).map((val: any, i) => (
															<td
																key={i}
																className="px-4 py-3 text-neutral-300 font-mono text-xs whitespace-nowrap"
															>
																{typeof val === "number" &&
																	!Number.isInteger(val)
																	? val.toFixed(4)
																	: val}
															</td>
														))}
													</motion.tr>
												))}
											</tbody>
										</table>
									</div>
								</div>
							</motion.div>
						)}
					</AnimatePresence>
				</div>
			</div>
		</main>
	);
}
